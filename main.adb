with STM32F40x;      use STM32F40x;
with STM32F40x.RCC;  use STM32F40x.RCC;
with STM32F40x.GPIO; use STM32F40x.GPIO;
with Ada.Real_Time;  use Ada.Real_Time;

procedure main is
  Led_Pin : constant := 6;
  Port    : ODR_Field renames GPIOA_Periph.ODR.ODR;
begin
  --  Включить clock for GPIO-A
  RCC_Periph.AHB1ENR.GPIOAEN := 1;
  --  Конфигурировать PA6
  GPIOA_Periph.MODER.ARR(Led_Pin) := 2#01#;
  GPIOA_Periph.OTYPER.OT.ARR(Led_Pin) := 0;
  GPIOA_Periph.OSPEEDR.ARR(Led_Pin) := 0;
  -- Переключать раз в секунду
  loop
     Port.Arr (Led_Pin) := Port.Arr (Led_Pin) xor 1;
     delay until Clock + To_Time_Span(1.0);
  end loop;
end main;
