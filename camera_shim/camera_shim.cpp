/*
 * camera.msm8996.so (Android 7.1 blob) calls the old no-argument
 * android::DisplayEventReceiver::DisplayEventReceiver(). Android 8.1 only
 * has DisplayEventReceiver(ISurfaceComposer::VsyncSource), so forward the
 * old symbol to it with eVsyncSourceApp (= 0), the 8.1 default argument.
 */
extern "C" void _ZN7android20DisplayEventReceiverC1ENS_16ISurfaceComposer11VsyncSourceE(void *self, int vsyncSource);

extern "C" void _ZN7android20DisplayEventReceiverC1Ev(void *self) {
    _ZN7android20DisplayEventReceiverC1ENS_16ISurfaceComposer11VsyncSourceE(self, 0);
}
