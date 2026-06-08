import mongoose from "mongoose";
import "dotenv/config";
import Restaurant from "./src/models/restaurant";

const MONGODB_URI = process.env.MONGODB_URI || "mongodb://localhost:27017/food_ordering_db";

const sampleRestaurants = [
  {
    restaurantName: "Pizza Paradise",
    city: "New York",
    country: "USA",
    deliveryPrice: 2.5,
    estimatedDeliveryTime: 30,
    cuisines: ["Italian", "Pizza"],
    menuItems: [
      { name: "Margherita Pizza", price: 12.99 },
      { name: "Pepperoni Pizza", price: 14.99 },
      { name: "Caesar Salad", price: 8.99 },
    ],
    imageUrl: "https://via.placeholder.com/300?text=Pizza+Paradise",
    lastUpdated: new Date(),
  },
  {
    restaurantName: "Burger Haven",
    city: "New York",
    country: "USA",
    deliveryPrice: 2.0,
    estimatedDeliveryTime: 25,
    cuisines: ["American", "Burgers"],
    menuItems: [
      { name: "Classic Burger", price: 10.99 },
      { name: "Cheeseburger", price: 11.99 },
      { name: "French Fries", price: 3.99 },
    ],
    imageUrl: "https://via.placeholder.com/300?text=Burger+Haven",
    lastUpdated: new Date(),
  },
  {
    restaurantName: "Sushi Express",
    city: "San Francisco",
    country: "USA",
    deliveryPrice: 3.0,
    estimatedDeliveryTime: 35,
    cuisines: ["Japanese", "Sushi"],
    menuItems: [
      { name: "California Roll", price: 9.99 },
      { name: "Dragon Roll", price: 13.99 },
      { name: "Miso Soup", price: 4.99 },
    ],
    imageUrl: "https://via.placeholder.com/300?text=Sushi+Express",
    lastUpdated: new Date(),
  },
  {
    restaurantName: "Taco Fiesta",
    city: "Los Angeles",
    country: "USA",
    deliveryPrice: 2.0,
    estimatedDeliveryTime: 20,
    cuisines: ["Mexican", "Tacos"],
    menuItems: [
      { name: "Carne Asada Tacos", price: 11.99 },
      { name: "Fish Tacos", price: 10.99 },
      { name: "Guacamole & Chips", price: 5.99 },
    ],
    imageUrl: "https://via.placeholder.com/300?text=Taco+Fiesta",
    lastUpdated: new Date(),
  },
  {
    restaurantName: "Curry House",
    city: "London",
    country: "UK",
    deliveryPrice: 2.5,
    estimatedDeliveryTime: 40,
    cuisines: ["Indian", "Curry"],
    menuItems: [
      { name: "Chicken Tikka Masala", price: 13.99 },
      { name: "Butter Chicken", price: 12.99 },
      { name: "Naan Bread", price: 2.99 },
    ],
    imageUrl: "https://via.placeholder.com/300?text=Curry+House",
    lastUpdated: new Date(),
  },
];

async function seedDatabase() {
  try {
    await mongoose.connect(MONGODB_URI);
    console.log("Connected to MongoDB");

    // Clear existing restaurants
    await Restaurant.deleteMany({});
    console.log("Cleared existing restaurants");

    // Insert sample restaurants
    const result = await Restaurant.insertMany(sampleRestaurants);
    console.log(`Inserted ${result.length} restaurants`);
    console.log("Restaurants added successfully!");

    await mongoose.disconnect();
    console.log("Disconnected from MongoDB");
  } catch (error) {
    console.error("Error seeding database:", error);
    process.exit(1);
  }
}

seedDatabase();
