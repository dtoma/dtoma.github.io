# X Macros

```c++
#define MESSAGE_TYPE \
    X('0', Heartbeat) \
    X('1', TestRequest) \
    X('2', ResendRequest) \
    X('3', Reject) \
    X('4', SequenceReset) \
    X('5', Logout) \
    X('6', IndicationofInterest) \
    X('7', Advertisement) \
    X('8', ExecutionReport) \
    X('9', OrderCancelReject) \
    X('A', Logon) \
    X('B', News) \
    X('C', Email) \
    X('D', OrderSingle) \
    X('E', OrderList) \
    X('F', OrderCancelRequest) \
    X('G', OrderCancelReplaceRequest) \
    X('H', OrderStatusRequest)


#define X(code, name) name = code,
enum class MessageType: char {
    MESSAGE_TYPE
};
#undef X

auto message_type_to_str(MessageType message_type) {
    #define X(code, name) case MessageType::name: return #name; break;
    switch (message_type) {
        MESSAGE_TYPE
    }
    #undef X
    return "";
}
```

Preprocessor output (formatted):
```
enum class MessageType: char {
    Heartbeat = '0',
    TestRequest = '1',
    ResendRequest = '2',
    Reject = '3',
    SequenceReset = '4',
    Logout = '5',
    IndicationofInterest = '6',
    Advertisement = '7',
    ExecutionReport = '8',
    OrderCancelReject = '9',
    Logon = 'A',
    News = 'B',
    Email = 'C',
    OrderSingle = 'D',
    OrderList = 'E',
    OrderCancelRequest = 'F',
    OrderCancelReplaceRequest = 'G',
    OrderStatusRequest = 'H',
};


auto message_type_to_str(MessageType message_type) {

    switch (message_type) {
        case MessageType::Heartbeat:                    return "Heartbeat";
        case MessageType::TestRequest:                  return "TestRequest";
        case MessageType::ResendRequest:                return "ResendRequest";
        case MessageType::Reject:                       return "Reject";
        case MessageType::SequenceReset:                return "SequenceReset";
        case MessageType::Logout:                       return "Logout";
        case MessageType::IndicationofInterest:         return "IndicationofInterest";
        case MessageType::Advertisement:                return "Advertisement";
        case MessageType::ExecutionReport:              return "ExecutionReport";
        case MessageType::OrderCancelReject:            return "OrderCancelReject";
        case MessageType::Logon:                        return "Logon";
        case MessageType::News:                         return "News";
        case MessageType::Email:                        return "Email";
        case MessageType::OrderSingle:                  return "OrderSingle";
        case MessageType::OrderList:                    return "OrderList";
        case MessageType::OrderCancelRequest:           return "OrderCancelRequest";
        case MessageType::OrderCancelReplaceRequest:    return "OrderCancelReplaceRequest";
        case MessageType::OrderStatusRequest:           return "OrderStatusRequest";
    }

    return "";
}

```

Executable output:
```cpp
#include <iostream>

int main() {
    std::cout << message_type_to_str(MessageType::Reject) << '\n';
}
```

```
$> g++ xmacros.cpp 
$> ./a.out 
Reject
```
