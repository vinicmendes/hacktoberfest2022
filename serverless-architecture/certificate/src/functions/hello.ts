export const handle = async (event) => {
  return {
    statusCode: 201,
    body: {
      message: "Hello World Ignite Serverless",
    },
    headers: {
      "Content-Type": "application/json",
    },
  };
};
