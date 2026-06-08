import http from "k6/http";

export const options = {
  vus: 2000,
  duration: "5m",
};

export default function () {
  http.get(
    "http://food-ordering-alb-672844302.ap-south-1.elb.amazonaws.com/api/restaurant"
  );
}