module ApplicationHelper

    def format_date(date)
        date.strftime("%v %H:%M %p")
    end

    def render_turbo_stream_flash_messages
        turbo_stream.prepend 'flash_message', partial: 'layouts/flashes' 
    end
end
