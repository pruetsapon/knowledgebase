import http from "k6/http";
import { sleep, check } from "k6";

export let options = {
  stages: [
     { duration: "30s", target: 20 },
     { duration: "10s", target: 10 },
     { duration: "20s", target: 0 },
   ]
};

export default function() {
    let data = {
      base64String: "base64String",
      filename:  "filename",
      thumbnail:  "thumbnail",
      tags: ["tags"]
    };
    let headers = { "Content-Type": "application/json" };
    let res = http.post("http://localhost:3001/document", JSON.stringify(data), { headers: headers });
    check(res, {
      "status was 200": (r) => r.status == 200,
      "transaction time OK": (r) => r.timings.duration < 200
    });
    sleep(1);
};