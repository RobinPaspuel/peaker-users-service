import { Hono } from "hono";

const app = new Hono();

const api = new Hono().basePath("/api/v1");

app.notFound((c) => {
  return c.text("Custom 404 Message", 404);
});

app.onError((err, c) => {
  console.error(`${err}`);
  return c.text("Custom Error Message", 500);
});

api.get("/", (c) => c.text("Hello Hono!"));

app.route("/", api);

export default {
  port: Bun.env.PORT,
  fetch: app.fetch,
};
