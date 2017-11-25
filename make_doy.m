function [DOY] = make_doy(year,month,day)
%1. determine if year is a leap year:

if (mod((year-2000),4) == 0)
    if month == 1
        month_doy = 0;
    elseif month == 2
        month_doy = 31;
    elseif month == 3
        month_doy = 31 + 29;
    elseif month == 4
        month_doy = 31 + 29 + 31;
    elseif month == 5
        month_doy = 31 + 29 + 31 + 30;
    elseif month == 6
        month_doy = 31 + 29 + 31 + 30 + 31;
    elseif month == 7
        month_doy = 31 + 29 + 31 + 30 + 31 + 30;
    elseif month == 8
        month_doy = 31 + 29 + 31 + 30 + 31 + 30 +31;
    elseif month == 9
        month_doy = 31 + 29 + 31 + 30 + 31 + 30 +31 + 31;
    elseif month == 10
        month_doy = 31 + 29 + 31 + 30 + 31 + 30 +31 + 31 + 30;
    elseif month == 11
        month_doy = 31 + 29 + 31 + 30 + 31 + 30 +31 + 31 + 30 +31;
    else
        month_doy = 31 + 29 + 31 + 30 + 31 + 30 +31 + 31 + 30 +31 + 30;
    end
else % not a leap year
     if month == 1
        month_doy = 0;
    elseif month == 2
        month_doy = 31;
    elseif month == 3
        month_doy = 31 + 28;
    elseif month == 4
        month_doy = 31 + 28 + 31;
    elseif month == 5
        month_doy = 31 + 28 + 31 + 30;
    elseif month == 6
        month_doy = 31 + 28 + 31 + 30 + 31;
    elseif month == 7
        month_doy = 31 + 28 + 31 + 30 + 31 + 30;
    elseif month == 8
        month_doy = 31 + 28 + 31 + 30 + 31 + 30 +31;
    elseif month == 9
        month_doy = 31 + 28 + 31 + 30 + 31 + 30 +31 + 31;
    elseif month == 10
        month_doy = 31 + 28 + 31 + 30 + 31 + 30 +31 + 31 + 30;
    elseif month == 11
        month_doy = 31 + 28 + 31 + 30 + 31 + 30 +31 + 31 + 30 +31;
    else
        month_doy = 31 + 28 + 31 + 30 + 31 + 30 +31 + 31 + 30 +31 + 30;
     end
end

DOY = day + month_doy;
end

