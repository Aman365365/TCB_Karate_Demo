import http from 'k6/http';
import { check } from 'k6';


export const options = {
  scenarios: {
    contacts: {
	  executor: 'ramping-vus',
      startVUs: 3,
      stages: [
        { target: 10, duration: '30s' }, 
        { target: 20, duration: '0' }, 
        { target: 30, duration: '45s' }, 
      ],
    },
  },
};

export let options1 = {
  thresholds: {
    http_req_duration: ['p(95)<500', 'p(99)<1500'],
   
  },
}
export default function contacts() {
let putPayload = {
            "name": "morpheus frank",
            "job": "zion resident"
    }

    let res = http.put("https://reqres.in/api/users/2", JSON.stringify(putPayload), {
        headers: {
            "Content-Type": "application/json"
        }});
    console.log("PUT Method: The new name is " + res.json().name);
    console.log('Response time was ' + String(res.timings.duration) + ' ms');

    check(res, { 'status was 200': (r) => r.status == 200 });
    }
/**
 * 
 */