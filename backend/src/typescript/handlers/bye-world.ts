import { APIGatewayProxyEvent, APIGatewayProxyResult, Handler } from 'aws-lambda'
import { bye } from '../functions/common';

export const handler = <Handler<APIGatewayProxyEvent, APIGatewayProxyResult>>(async (event, context) => {
    const name = event.queryStringParameters?.["hi"]
    return {
        statusCode: 200,
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ message: `${name} ${bye}` })
    };
})