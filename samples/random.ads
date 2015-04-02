---------------------------------------------------------------------------
-- FILE          : random.ads
-- LAST REVISION : 2008-06-22
-- SUBJECT       : Specification of a random number generator package.
-- PROGRAMMER    : (C) Copyright 2008 by Peter C. Chapin
--
-- Please send comments or bug reports to
--
--      Peter C. Chapin
--      Computer Information Systems
--      Vermont Technical College
--      Randolph Center, VT 05061
--      Peter.Chapin@vtc.vsc.edu
---------------------------------------------------------------------------
private with Interfaces;

package Random is

   -- This package produces random numbers in this subtype.
   type Number_Type is range 0 .. 2**16 - 1;

   -- The details of this type are hidden.
   type Generator is private;

   -- Returns a properly seeded random number generator.
   function Make(Seed : Number_Type) return Generator;

   -- Using a Generator, produce the next random number.
   procedure Next(Gen : in out Generator; Number : out Number_Type);

   -- Using a Generator, produce the next number in a specific range.
   procedure Next
     (Gen       : in out Generator;
      Low, High : in     Number_Type;
      Number    :    out Number_Type);

   -- Raised if Low > High in procedure Next above.
   Bad_Range : exception;

private

   -- The "full view" of the type.
   type Generator is
     record
        State : Interfaces.Unsigned_32;
     end record;

end Random;

