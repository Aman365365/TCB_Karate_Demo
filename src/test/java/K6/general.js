import http from 'k6/http';
import { sleep } from 'k6';

const BASE_URL = 'https://reqres.in';


export const options = {
  vus: 10,
  duration: '30s',
};

export let options1 = {
  thresholds: {
    http_req_duration: ['p(95)<500', 'p(99)<1500'],
   
  },
}

export default function () {
  let req;
  req = http.get(`${BASE_URL}/api/users?page=2`);

  const crocs = JSON.parse(req.body);
  if (crocs && crocs.length) {
    req = http.get(`${BASE_URL}/public/crocodiles/${crocs[0].id}/`);
  }
  sleep(0.3);
}
/**
 * 
 */