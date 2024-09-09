from aws_lambda_typing import events, context as context_, responses
from json import dumps


def lambda_handler(event: events.EventBridgeEvent, context: context_.Context) -> responses.APIGatewayProxyResponseV1:
    return {
        'statusCode': 200,
        'body': dumps({
            'message': "Hey girl can I get yo number"
        }),
        'headers': {
            "Content-Type": "application/json"
        }
    }
