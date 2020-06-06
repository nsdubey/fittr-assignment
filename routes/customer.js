const express = require('express');
const router = express.Router();
const moment = require("moment")

/**** Apply PromoCode Route **********/
router.post('/applyPromocode', (req, res, next) => {
    try {
        console.log("apply promocode")
        const { promocode, userId } = req.body;
        db.query(`select * from promocode where promocode = "${promocode}"`, (err, result) => {
            if (err) {
                console.log("error", err)
                return res.status(400).json({ status: "error", message: "something went wrong!" });
            }
            console.log(`select * from promocode where promocode = "${promocode}"`);
            console.log(result)
            if (result.length > 0) {
                const promocodeDetails = result[0];
                db.query(`select * from customer where id = "${userId}"`, (err, result) => {
                    if (err) {
                        console.log("error", err)
                        return res.status(400).json({ status: "error", message: "something went wrong!" });
                    }

                    if (result.length > 0) {
                        const userDetails = result[0];
                        const todate = moment(new Date()).format("YYYY-MM-DD");
                        console.log("todaye date,", todate)
                        if (userDetails.gender !== promocodeDetails.gender) {
                            return res.status(200).json({ status: "error", message: "You are not eligible for this promocode" });
                        }
                        if (userDetails.age < promocodeDetails.minAge) {
                            return res.status(200).json({ status: "error", message: "You are not eligible for this promocode" });
                        }
                        if (userDetails.region !== promocodeDetails.region) {
                            return res.status(200).json({ status: "error", message: "You are not eligible for this promocode" });
                        }
                        if (!(new Date(todate) <= new Date(promocodeDetails.endDate) && new Date(todate) >= new Date(promocodeDetails.startDate))) {
                            return res.status(200).json({ status: "error", message: "You are not eligible for this promocode" });
                        }

                        db.query(`INSERT INTO application (promocodeId, userId) VALUES ("${promocodeDetails.id}", "${userDetails.id}")`, (err, result) => {
                            if (err) {
                                console.log("error", err)
                                return res.status(400).json({ status: "error", message: "something went wrong!" });
                            }
                            return res.status(200).json({ status: "success", message: "Promocode applied successfully" });
                        })
                    }
                });
            }
        });
    } catch (err) {
        console.log(err)
        return res.status(500).json({ status: "error", message: "something went wrong!" });
    }
});


module.exports = router;
