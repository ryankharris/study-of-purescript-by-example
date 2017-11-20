module Main where

import Prelude
-- import Control.Monad.Eff (Eff)
-- import Control.Monad.Eff.Console (CONSOLE, log)
import Math (sqrt, pi)
-- import Math (sqrt, pow, pi)
import Control.Monad.Eff.Console (logShow)

-- | Calculates the area of a circle
-- | Could also write using pow as: circleArea r = pi * (pow r 2.0)
-- circleArea :: Number -> Number
circleArea r = pi * r * r

-- | Calculates the diagonal of a right triangle
-- diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w * w + h * h)

-- main :: forall e. Eff (console :: CONSOLE | e) Unit
-- main = do
--   log "Hello sailor!"
main = logShow (diagonal 3.0 4.0)
