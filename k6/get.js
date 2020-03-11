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
    let headers = { "Authentication": "Bearer xxxxxx" };
    let res = http.get("http://localhost:3001/document/1", { headers: headers });
    check(res, {
      "status was 200": (r) => r.status == 200,
      "transaction time OK": (r) => r.timings.duration < 200
    });
    sleep(1);
};