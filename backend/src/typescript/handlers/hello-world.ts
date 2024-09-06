import { APIGatewayProxyEvent, Handler } from 'aws-lambda'

export const handler = <Handler<APIGatewayProxyEvent>> (async (event, context) => {
    console.log('Event:\n', event)
    return "Hello world"
})