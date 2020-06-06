const express = require('express');
const router = express.Router();
const moment = require("moment");

/**** Create PromoCode Route **********/
router.post('/createPromocode', (req, res, next) => {
  try {
    const { promocode, minAge, gender, region } = req.body;
    const startDate = moment(new Date(req.body.startDate)).format("YYYY-MM-DD");
    const endDate = moment(new Date(req.body.endDate)).format("YYYY-MM-DD");
    const query = `INSERT INTO promocode (promocode, startDate, endDate, minAge, gender, region) VALUES ("${promocode}", "${startDate}", "${endDate}", "${minAge}", "${gender}", "${region}")`;

    db.query(`select * from promocode where promocode = "${promocode}"`, (err, result) => {
      if (err) {
        console.log("error", err)
        return res.status(400).json({ status: "error", message: "something went wrong!" });
      }
      if (result.length > 0) {
        return res.status(200).json({ status: "error", message: "Promocode already exists" });
      }
      db.query(query, (err, result) => {

        if (err) {
          console.log("error", err)
          return res.status(400).json({ status: "error", message: "something went wrong!" });
        }
        return res.status(200).json({ status: "success", message: "Promocode Generated successfully" });
      });
    })

  } catch (err) {
    return res.status(500).json({ status: "error", message: "something went wrong!" });
  }

});



module.exports = router;
