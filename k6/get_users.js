import http from 'k6/http';
import { check, sleep } from 'k6';


export let options = {
    vus: 20,
    duration: '1m',
    thresholds: {
        http_req_duration: ['p(95)<500'],
        http_req_failed: ['rate<0.01'],   
    },
};


export default function () {
    const res = http.get('https://fakerestapi.azurewebsites.net/api/v1/Users');

    check(res, {
        'status is 200': (r) => r.status === 200,
        'response time < 500ms': (r) => r.timings.duration < 500,
    });

    sleep(1);
}