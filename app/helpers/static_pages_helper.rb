module StaticPagesHelper
    def convert_date_from_datetime(time)
        "#{time.year}/#{time.month}/#{time.day}"
    end
    
    def convert_time_from_datetime(time)
        "#{time.hour}時#{time.min}分"
    end
    
end
