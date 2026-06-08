import express from "express";
import { param, validationResult } from "express-validator";
import RestaurantController from "../controllers/RestaurantController";

const router = express.Router();

// Validation error handler middleware
const handleValidationErrors = (req: any, res: any, next: any) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  next();
};

// Endpoint to get all unique cities for dropdown
router.get("/cities/all", RestaurantController.getAllCities);

router.get(
  "/:restaurantId",
  param("restaurantId")
    .isString()
    .trim()
    .notEmpty()
    .withMessage("RestaurantId paramenter must be a valid string"),
  handleValidationErrors,
  RestaurantController.getRestaurant
);

router.get(
  "/search/:city",
  param("city")
    .isString()
    .trim()
    .notEmpty()
    .withMessage("City paramenter must be a valid string"),
  handleValidationErrors,
  RestaurantController.searchRestaurant
);

export default router;
