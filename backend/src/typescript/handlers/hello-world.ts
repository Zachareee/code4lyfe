import { APIGatewayProxyEvent, APIGatewayProxyResult, Handler } from 'aws-lambda'

export const handler = <Handler<APIGatewayProxyEvent, APIGatewayProxyResult>>(async (event, context, done) => {
    return {
        statusCode: 200,
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ message: "Hello world" })
    };
})