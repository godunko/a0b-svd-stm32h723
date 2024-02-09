pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32H723.svd

pragma Restrictions (No_Elaboration_Code);

with A0B.Types.SVD;
with System;

package A0B.SVD.STM32H723.VREFBUF is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CSR_VRS_Field is A0B.Types.SVD.UInt3;

   --  VREFBUF control and status register
   type CSR_Register is record
      --  Voltage reference buffer mode enable This bit is used to enable the
      --  voltage reference buffer mode.
      ENVR          : Boolean := False;
      --  High impedance mode This bit controls the analog switch to connect or
      --  not the VREF+ pin. Refer to Table196: VREF buffer modes for the mode
      --  descriptions depending on ENVR bit configuration.
      HIZ           : Boolean := True;
      --  unspecified
      Reserved_2_2  : A0B.Types.SVD.Bit := 16#0#;
      --  Read-only. Voltage reference buffer ready
      VRR           : Boolean := False;
      --  Voltage reference scale These bits select the value generated by the
      --  voltage reference buffer. Other: Reserved
      VRS           : CSR_VRS_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : A0B.Types.SVD.UInt25 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      ENVR          at 0 range 0 .. 0;
      HIZ           at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      VRR           at 0 range 3 .. 3;
      VRS           at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype CCR_TRIM_Field is A0B.Types.SVD.UInt6;

   --  VREFBUF calibration control register
   type CCR_Register is record
      --  Trimming code These bits are automatically initialized after reset
      --  with the trimming value stored in the Flash memory during the
      --  production test. Writing into these bits allows to tune the internal
      --  reference buffer voltage.
      TRIM          : CCR_TRIM_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : A0B.Types.SVD.UInt26 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      TRIM          at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  VREFBUF
   type VREFBUF_Peripheral is record
      --  VREFBUF control and status register
      CSR : aliased CSR_Register;
      pragma Volatile_Full_Access (CSR);
      --  VREFBUF calibration control register
      CCR : aliased CCR_Register;
      pragma Volatile_Full_Access (CCR);
   end record
     with Volatile;

   for VREFBUF_Peripheral use record
      CSR at 16#0# range 0 .. 31;
      CCR at 16#4# range 0 .. 31;
   end record;

   --  VREFBUF
   VREFBUF_Periph : aliased VREFBUF_Peripheral
     with Import, Address => VREFBUF_Base;

end A0B.SVD.STM32H723.VREFBUF;