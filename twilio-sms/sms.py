from twilio.rest import Client
account_sid = '[ACCOUNT_SID]'
auth_token  = '[AUTH_TOKEN]'
client = Client(account_sid,auth_token)
message  = client.messages.create(
            body='This is a test message!',
            from_='+12054984270',
            to='+91444444444'
           )
print(message.sid)
