/* Stub the protobuf symbols that vendor libcne*.so cannot find.
 * These are no-ops. CNE/modem data will not work correctly.
 */
#include <cstddef>
#include <cstdint>

// _ZN6google8protobuf2io16CodedInputStream20ReadVarint32FallbackEPj
extern "C" int _ZN6google8protobuf2io16CodedInputStream20ReadVarint32FallbackEPj(void *self, uint32_t *value) {
    (void)self;
    if (value) *value = 0;
    return 0;
}

// _ZN6google8protobuf8internal21StringTypeHandlerBase3NewEv
extern "C" void *_ZN6google8protobuf8internal21StringTypeHandlerBase3NewEv() {
    return nullptr;
}
