pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H723.svd

pragma Restrictions (No_Elaboration_Code);

with A0B.Types.SVD;
with System;

package A0B.SVD.STM32H723.CRS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_TRIM_Field is A0B.Types.SVD.UInt6;

   --  CRS control register
   type CR_Register is record
      --  SYNC event OK interrupt enable
      SYNCOKIE       : Boolean := False;
      --  SYNC warning interrupt enable
      SYNCWARNIE     : Boolean := False;
      --  Synchronization or trimming error interrupt enable
      ERRIE          : Boolean := False;
      --  Expected SYNC interrupt enable
      ESYNCIE        : Boolean := False;
      --  unspecified
      Reserved_4_4   : A0B.Types.SVD.Bit := 16#0#;
      --  Frequency error counter enable This bit enables the oscillator clock
      --  for the frequency error counter. When this bit is set, the CRS_CFGR
      --  register is write-protected and cannot be modified.
      CEN            : Boolean := False;
      --  Automatic trimming enable This bit enables the automatic hardware
      --  adjustment of TRIM bits according to the measured frequency error
      --  between two SYNC events. If this bit is set, the TRIM bits are
      --  read-only. The TRIM value can be adjusted by hardware by one or two
      --  steps at a time, depending on the measured frequency error value.
      --  Refer to Section7.3.4: Frequency error evaluation and automatic
      --  trimming for more details.
      AUTOTRIMEN     : Boolean := False;
      --  Read-only. Generate software SYNC event This bit is set by software
      --  in order to generate a software SYNC event. It is automatically
      --  cleared by hardware.
      SWSYNC         : Boolean := False;
      --  HSI48 oscillator smooth trimming These bits provide a
      --  user-programmable trimming value to the HSI48 oscillator. They can be
      --  programmed to adjust to variations in voltage and temperature that
      --  influence the frequency of the HSI48. The default value is 32, which
      --  corresponds to the middle of the trimming interval. The trimming step
      --  is around 67 kHz between two consecutive TRIM steps. A higher TRIM
      --  value corresponds to a higher output frequency. When the AUTOTRIMEN
      --  bit is set, this field is controlled by hardware and is read-only.
      TRIM           : CR_TRIM_Field := 16#20#;
      --  unspecified
      Reserved_14_31 : A0B.Types.SVD.UInt18 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CR_Register use record
      SYNCOKIE       at 0 range 0 .. 0;
      SYNCWARNIE     at 0 range 1 .. 1;
      ERRIE          at 0 range 2 .. 2;
      ESYNCIE        at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      CEN            at 0 range 5 .. 5;
      AUTOTRIMEN     at 0 range 6 .. 6;
      SWSYNC         at 0 range 7 .. 7;
      TRIM           at 0 range 8 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype CFGR_RELOAD_Field is A0B.Types.SVD.UInt16;
   subtype CFGR_FELIM_Field is A0B.Types.SVD.Byte;
   subtype CFGR_SYNCDIV_Field is A0B.Types.SVD.UInt3;
   subtype CFGR_SYNCSRC_Field is A0B.Types.SVD.UInt2;

   --  This register can be written only when the frequency error counter is
   --  disabled (CEN bit is cleared in CRS_CR). When the counter is enabled,
   --  this register is write-protected.
   type CFGR_Register is record
      --  Counter reload value RELOAD is the value to be loaded in the
      --  frequency error counter with each SYNC event. Refer to Section7.3.3:
      --  Frequency error measurement for more details about counter behavior.
      RELOAD         : CFGR_RELOAD_Field := 16#BB7F#;
      --  Frequency error limit FELIM contains the value to be used to evaluate
      --  the captured frequency error value latched in the FECAP[15:0] bits of
      --  the CRS_ISR register. Refer to Section7.3.4: Frequency error
      --  evaluation and automatic trimming for more details about FECAP
      --  evaluation.
      FELIM          : CFGR_FELIM_Field := 16#22#;
      --  SYNC divider These bits are set and cleared by software to control
      --  the division factor of the SYNC signal.
      SYNCDIV        : CFGR_SYNCDIV_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : A0B.Types.SVD.Bit := 16#0#;
      --  SYNC signal source selection These bits are set and cleared by
      --  software to select the SYNC signal source. Note: When using USB LPM
      --  (Link Power Management) and the device is in Sleep mode, the periodic
      --  USB SOF will not be generated by the host. No SYNC signal will
      --  therefore be provided to the CRS to calibrate the HSI48 on the run.
      --  To guarantee the required clock precision after waking up from Sleep
      --  mode, the LSE or reference clock on the GPIOs should be used as SYNC
      --  signal.
      SYNCSRC        : CFGR_SYNCSRC_Field := 16#2#;
      --  unspecified
      Reserved_30_30 : A0B.Types.SVD.Bit := 16#0#;
      --  SYNC polarity selection This bit is set and cleared by software to
      --  select the input polarity for the SYNC signal source.
      SYNCPOL        : Boolean := False;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      RELOAD         at 0 range 0 .. 15;
      FELIM          at 0 range 16 .. 23;
      SYNCDIV        at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      SYNCSRC        at 0 range 28 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      SYNCPOL        at 0 range 31 .. 31;
   end record;

   subtype ISR_FECAP_Field is A0B.Types.SVD.UInt16;

   --  CRS interrupt and status register
   type ISR_Register is record
      --  Read-only. SYNC event OK flag This flag is set by hardware when the
      --  measured frequency error is smaller than FELIM * 3. This means that
      --  either no adjustment of the TRIM value is needed or that an
      --  adjustment by one trimming step is enough to compensate the frequency
      --  error. An interrupt is generated if the SYNCOKIE bit is set in the
      --  CRS_CR register. It is cleared by software by setting the SYNCOKC bit
      --  in the CRS_ICR register.
      SYNCOKF        : Boolean;
      --  Read-only. SYNC warning flag This flag is set by hardware when the
      --  measured frequency error is greater than or equal to FELIM * 3, but
      --  smaller than FELIM * 128. This means that to compensate the frequency
      --  error, the TRIM value must be adjusted by two steps or more. An
      --  interrupt is generated if the SYNCWARNIE bit is set in the CRS_CR
      --  register. It is cleared by software by setting the SYNCWARNC bit in
      --  the CRS_ICR register.
      SYNCWARNF      : Boolean;
      --  Read-only. Error flag This flag is set by hardware in case of any
      --  synchronization or trimming error. It is the logical OR of the
      --  TRIMOVF, SYNCMISS and SYNCERR bits. An interrupt is generated if the
      --  ERRIE bit is set in the CRS_CR register. It is cleared by software in
      --  reaction to setting the ERRC bit in the CRS_ICR register, which
      --  clears the TRIMOVF, SYNCMISS and SYNCERR bits.
      ERRF           : Boolean;
      --  Read-only. Expected SYNC flag This flag is set by hardware when the
      --  frequency error counter reached a zero value. An interrupt is
      --  generated if the ESYNCIE bit is set in the CRS_CR register. It is
      --  cleared by software by setting the ESYNCC bit in the CRS_ICR
      --  register.
      ESYNCF         : Boolean;
      --  unspecified
      Reserved_4_7   : A0B.Types.SVD.UInt4;
      --  Read-only. SYNC error This flag is set by hardware when the SYNC
      --  pulse arrives before the ESYNC event and the measured frequency error
      --  is greater than or equal to FELIM * 128. This means that the
      --  frequency error is too big (internal frequency too low) to be
      --  compensated by adjusting the TRIM value, and that some other action
      --  should be taken. An interrupt is generated if the ERRIE bit is set in
      --  the CRS_CR register. It is cleared by software by setting the ERRC
      --  bit in the CRS_ICR register.
      SYNCERR        : Boolean;
      --  Read-only. SYNC missed This flag is set by hardware when the
      --  frequency error counter reached value FELIM * 128 and no SYNC was
      --  detected, meaning either that a SYNC pulse was missed or that the
      --  frequency error is too big (internal frequency too high) to be
      --  compensated by adjusting the TRIM value, and that some other action
      --  should be taken. At this point, the frequency error counter is
      --  stopped (waiting for a next SYNC) and an interrupt is generated if
      --  the ERRIE bit is set in the CRS_CR register. It is cleared by
      --  software by setting the ERRC bit in the CRS_ICR register.
      SYNCMISS       : Boolean;
      --  Read-only. Trimming overflow or underflow This flag is set by
      --  hardware when the automatic trimming tries to over- or under-flow the
      --  TRIM value. An interrupt is generated if the ERRIE bit is set in the
      --  CRS_CR register. It is cleared by software by setting the ERRC bit in
      --  the CRS_ICR register.
      TRIMOVF        : Boolean;
      --  unspecified
      Reserved_11_14 : A0B.Types.SVD.UInt4;
      --  Read-only. Frequency error direction FEDIR is the counting direction
      --  of the frequency error counter latched in the time of the last SYNC
      --  event. It shows whether the actual frequency is below or above the
      --  target.
      FEDIR          : Boolean;
      --  Read-only. Frequency error capture FECAP is the frequency error
      --  counter value latched in the time of the last SYNC event. Refer to
      --  Section7.3.4: Frequency error evaluation and automatic trimming for
      --  more details about FECAP usage.
      FECAP          : ISR_FECAP_Field;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      SYNCOKF        at 0 range 0 .. 0;
      SYNCWARNF      at 0 range 1 .. 1;
      ERRF           at 0 range 2 .. 2;
      ESYNCF         at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      SYNCERR        at 0 range 8 .. 8;
      SYNCMISS       at 0 range 9 .. 9;
      TRIMOVF        at 0 range 10 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      FEDIR          at 0 range 15 .. 15;
      FECAP          at 0 range 16 .. 31;
   end record;

   --  CRS interrupt flag clear register
   type ICR_Register is record
      --  SYNC event OK clear flag Writing 1 to this bit clears the SYNCOKF
      --  flag in the CRS_ISR register.
      SYNCOKC       : Boolean := False;
      --  SYNC warning clear flag Writing 1 to this bit clears the SYNCWARNF
      --  flag in the CRS_ISR register.
      SYNCWARNC     : Boolean := False;
      --  Error clear flag Writing 1 to this bit clears TRIMOVF, SYNCMISS and
      --  SYNCERR bits and consequently also the ERRF flag in the CRS_ISR
      --  register.
      ERRC          : Boolean := False;
      --  Expected SYNC clear flag Writing 1 to this bit clears the ESYNCF flag
      --  in the CRS_ISR register.
      ESYNCC        : Boolean := False;
      --  unspecified
      Reserved_4_31 : A0B.Types.SVD.UInt28 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      SYNCOKC       at 0 range 0 .. 0;
      SYNCWARNC     at 0 range 1 .. 1;
      ERRC          at 0 range 2 .. 2;
      ESYNCC        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Clock Recovery System
   type CRS_Peripheral is record
      --  CRS control register
      CR   : aliased CR_Register;
      pragma Volatile_Full_Access (CR);
      --  This register can be written only when the frequency error counter is
      --  disabled (CEN bit is cleared in CRS_CR). When the counter is enabled,
      --  this register is write-protected.
      CFGR : aliased CFGR_Register;
      pragma Volatile_Full_Access (CFGR);
      --  CRS interrupt and status register
      ISR  : aliased ISR_Register;
      pragma Volatile_Full_Access (ISR);
      --  CRS interrupt flag clear register
      ICR  : aliased ICR_Register;
      pragma Volatile_Full_Access (ICR);
   end record
     with Volatile;

   for CRS_Peripheral use record
      CR   at 16#0# range 0 .. 31;
      CFGR at 16#4# range 0 .. 31;
      ISR  at 16#8# range 0 .. 31;
      ICR  at 16#C# range 0 .. 31;
   end record;

   --  Clock Recovery System
   CRS_Periph : aliased CRS_Peripheral
     with Import, Address => CRS_Base;

end A0B.SVD.STM32H723.CRS;
