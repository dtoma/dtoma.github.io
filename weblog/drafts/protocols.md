# Working with protocols

Useful bits of code when working with text or binary protocols.

## X Macros

Easily convert an enum value to a string, eg. when displaying feedback for a user.

```c++
#define FOR_ALL_MESSAGE_TYPE(X) \
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


#define ENUMIFY(code, name) name = code,
enum class MessageType: char {
    FOR_ALL_MESSAGE_TYPE(ENUMIFY)
};
#undef X

auto message_type_to_str(MessageType message_type) {
    #define CASEIFY(code, name) case MessageType::name: return #name; break;
    switch (message_type) {
        FOR_ALL_MESSAGE_TYPE(CASEIFY)
    }
    #undef CASEIFY
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

## static_assert

If we pack our `struct`s, this works fine:

```cpp
#pragma pack(1)

struct Header {
    char MessageType;
};

struct Reject {
    Header header;
    int OrderId;
};

static_assert(sizeof(Reject) == 5, "Unexpected Reject struct size");

int main() {
    return sizeof(Reject);
}
```

If we had forgotten to use the right pragma, or omitted a field in the message, we'd have a compilation error:

```
$> clang staticassert.cpp
<source>:10:1: error: static_assert failed "Unexpected Reject struct size"

static_assert(sizeof(Reject) == 5, "Unexpected Reject struct size");

^             ~~~~~~~~~~~~~~~~~~~

1 error generated.
```

We can use X macros to generate all the checks for our messages:

```c++
#pragma pack(1)

#define FOR_ALL_MESSAGE_TYPE(X) \
    X('3', Reject, 4)
    // etc.

struct Header {
    char MessageType;
};

struct Reject {
    Header header;
    int OrderId;
};

#define ASSERT_SIZE(code, name, size) \
    static_assert(sizeof(name) == size + sizeof(Header), "Unexpected "#name" struct size");
FOR_ALL_MESSAGE_TYPE(ASSERT_SIZE)
#undef ASSERT_SIZE
```

## Hexdump
