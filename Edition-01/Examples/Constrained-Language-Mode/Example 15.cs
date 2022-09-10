internal static class WldpNativeConstants
{
    internal const uint WLDP_HOST_INFORMATION_REVISION = 0x00000001;

    internal const uint WLDP_LOCKDOWN_UNDEFINED = 0;
    internal const uint WLDP_LOCKDOWN_DEFINED_FLAG = 0x80000000;
    internal const uint WLDP_LOCKDOWN_SECUREBOOT_FLAG = 1;
    internal const uint WLDP_LOCKDOWN_DEBUGPOLICY_FLAG = 2;
    internal const uint WLDP_LOCKDOWN_UMCIENFORCE_FLAG = 4;
    internal const uint WLDP_LOCKDOWN_UMCIAUDIT_FLAG = 8;
}
