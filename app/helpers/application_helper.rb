module ApplicationHelper

    def format_date(date)
        date.strftime("%v %H:%M %p")
    end
end
