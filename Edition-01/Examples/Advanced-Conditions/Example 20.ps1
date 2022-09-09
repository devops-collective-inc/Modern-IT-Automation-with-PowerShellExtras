Add-Type -TypeDefinition @"
   [System.Flags]
   public enum Colors
   {
      Red = 1,
      Green = 2,
      Blue = 4,
      Yellow = 8,
      Black = 16,
      White = 32,
      // You must use powers of 2 (for example: 1,2,4,6,8,...)
   }
"@
# Same as the previous example, print Every Combination of the color up to 16
# Please note that the upper limit is 63.
for ($i = 0; $i -le 16; $i++) {
    "{0} {1}" -f $i, [Colors]$I
}
