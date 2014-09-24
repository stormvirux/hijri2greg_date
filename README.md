# Hijri2gregDate

This is a converter that can convert gregorian dates to hijri dates and similiarly hijri dates to gregorian.

## Installation

Add this line to your application's Gemfile:

    gem 'hijri2greg_date'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hijri2greg_date

If using with ruby instead of rails then:
    
    $ gem install hijri2greg_date
    require 'hijri2greg_date'

## Usage

   There are two methods you can use for conversion

  1. to_hijri
    
    This is for gregorian to hijri conversion.You can either use a Date object or Time object with this method as shown in following Examples.
    
    For example
    
   ```  abc=Time.now
     => 2014-09-24 08:48:50 +0530
    
     abc.to_hijri
     => 1435-11-29
    
     also
    
   
     abc=Date.today
     => #<Date: 2014-09-24 ((2456925j,0s,0n),+0s,2299161j)> 
     abc.to_hijri
     => 1435-11-29
     
    ```
    
  2. to_greg
   
   This is for hijri to gregorian conversion.You can either use a Date object or Time object with this method as shown in following Examples.
  
   For example
    ```
    abc=Time.parse("1435-11-29 08:48:50 +0530")
     => 1435-11-29 09:12:10 +0553```
   
    abc.to_greg
     => "2014-9-24"
    
    also
    
    abc=Date.parse("1435-11-29")
    => #<Date: 1435-11-29 ((2245524j,0s,0n),+0s,2299161j)>  
    
    abc.to_greg
    => 1435-11-29
   ```

## Contributing

1. Fork it ( https://github.com/stormvirux/hijri2greg_date/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
