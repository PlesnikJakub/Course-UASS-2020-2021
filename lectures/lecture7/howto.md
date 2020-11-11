
## Data
```
<Message Sender="name00060@domain0002.cz" Sent="2010-01-18T21:58:48.000Z" MessageId="cd232356-c2b5-4d9f-be22-9893295fac57" InReplyTo="74c7a36f-b014-407b-bc45-1f3df216ac0e">
  <Recipient Type="To">name00063@domain0002.cz</Recipient>
  <Recipient Type="To">name00062@domain0002.cz</Recipient>
  <Recipient Type="To">name00062@domain0002.cz</Recipient>
  <Recipient Type="To">name00004@domain0002.cz</Recipient>
</Message>
```

## HARDCORE
```
<Message Sender=" ">
<Recipient Type="To"> </Recipient>
```
## DESERIALIZACE
```
public class Message{
    public string Sender;

    public List<Recipient> Recipients;
}

public class Recipient{
    public string To;
}
```

### Extracted entities
```
name00060@domain0002.cz 1
name00063@domain0002.cz 2
name00062@domain0002.cz 3
name00064@domain0002.cz 4
name00004@domain0002.cz 5
```
### List of edges
```
name00060@domain0002.cz; name00063@domain0002.cz
name00060@domain0002.cz; name00062@domain0002.cz
name00060@domain0002.cz; name00064@domain0002.cz
name00060@domain0002.cz; name00004@domain0002.cz
```

### List of edges
```
1;2
1;3
1;4
1;5

2:3
2:4
2:5

3:4
3:5

4:5
```
