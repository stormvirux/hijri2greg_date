#require "hijri2greg_date/version"
require 'time'
require 'date'

class Time
  def to_hijri
    return Hijri2gregDate.Gregorian2Hijri(self.to_s.split(" ")[0].split("-"))
  end
  def to_greg
    return Hijri2gregDate.Hijri2Gregorian(self.to_s.split(" ")[0].split("-"))
  end
end

class Date
  def to_hijri
    return Hijri2gregDate.Gregorian2Hijri(self.to_s.split("-"))
  end
  def to_greg
    return Hijri2gregDate.Hijri2Gregorian(self.to_s.split("-"))
  end
end


class Hijri2gregDate

  def self.intPart(floatNum)
    if floatNum < -0.0000001
      return (floatNum - 0.0000001).ceil
    end
    return (floatNum + 0.0000001).floor
  end

  def self.Gregorian2Hijri(time)
      yr,mth,day=time[0].to_i,time[1].to_i,time[2].to_i
      if ((yr > 1582) or ((yr == 1582) and (mth > 10)) or
        ((yr == 1582) and (mth == 10) and (day > 14)))
         jd1 = intPart((1461 * (yr + 4800 +
                          intPart((mth - 14) / 12.0))) / 4)
         jd2 = intPart((367 * (mth - 2 - 12 *
                         (intPart((mth - 14) / 12.0)))) / 12)
         jd3 = intPart((3 * (intPart((yr + 4900 +
                          intPart((mth - 14) / 12.0)) / 100))) / 4)
         jd = jd1 + jd2 - jd3 + day - 32075
      else
         jd1 = intPart((7 * (yr + 5001 +
                          intPart((mth - 9) / 7.0))) / 4)
         jd2 = intPart((275 * mth) / 9.0)
         jd = 367 * yr - jd1 + jd2 + day + 1729777
      end

      l = jd - 1948440 + 10632
      n = intPart((l - 1) /10631.0)
      l = l - 10631 * n + 354
      j1 = (intPart((10985 - l) / 5316.0)) * (intPart((50 * l) / 17719.0))
      j2 = (intPart(l / 5670.0)) * (intPart((43 * l) / 15238.0))
      j = j1 + j2
      l1 = (intPart((30 - j) / 15.0)) * (intPart((17719 * j) / 50.0))
      l2 = (intPart(j / 16.0)) * (intPart((15238 * j) / 43.0))
      l = l - l1 - l2 + 29
      m = intPart((24 * l) / 709.0)
      d = l - intPart((709 * m) / 24.0)
      y = 30 * n + j - 30

      return [y, m, d].join("-")
  end

  def self.Hijri2Gregorian(time)
      yr,mth,day=time[0].to_i,time[1].to_i,time[2].to_i
      jd1 = intPart((11 * yr + 3) / 30.0)
      jd2 = intPart((mth - 1) / 2.0)
      jd = jd1 + 354 * yr + 30 * mth - jd2 + day + 1948440 - 385

      if jd > 2299160
         l = jd + 68569
         n = intPart((4 * l) / 146097.0)
         l = l - intPart((146097 * n + 3) / 4.0)
         i = intPart((4000 * (l + 1)) / 1461001.0)
         l = l - intPart((1461 * i) / 4.0) + 31
         j = intPart((80 * l) / 2447.0)
         d = l - intPart((2447 * j) / 80.0)
         l = intPart(j / 11.0)
         m = j + 2 - 12 * l
         y = 100 * (n - 49) + i + l
      else
         j = jd + 1402
         k = intPart((j - 1) / 1461.0)
         l = j - 1461 * k
         n = intPart((l - 1) / 365.0) - intPart(l / 1461.0)
         i = l - 365 * n + 30
         j = intPart((80 * i) / 2447.0)
         d = i - intPart((2447 * j) / 80.0)
         i = intPart(j / 11.0)
         m = j + 2 - 12 * i
         y = 4 * k + n + i - 4716
      end
      return [y, m, d].join("-")
  end
end


