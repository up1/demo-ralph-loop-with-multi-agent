const request = require('supertest');
const app = require('./app');

describe('GET /hello', () => {
  it('returns 200 with a greeting message', async () => {
    const res = await request(app).get('/hello');

    expect(res.status).toBe(200);
    expect(res.body).toEqual({ message: 'Hello, World!' });
  });
});
