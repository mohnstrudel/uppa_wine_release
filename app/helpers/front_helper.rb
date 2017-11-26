module FrontHelper

  def get_bottle_class(index)
    case index
    when 0
      return "upperBlock"
    when 1
      return "firstBottle"
    when 2
      return "secondBottle"
    when 3
      return "thirdBottle"
    when 4
      return "fourthBottle"
    when 5
      return "fifthBottle"
    when 6
      return "sixthBottle"
    end
  end

  def image_tag_or_default(object, field, options = {})
    if object.send(field).present?
      return image_tag(object.send(field).url, class: options[:class])
    else
      return image_tag "bottles/second.png", class: options[:class]
    end
  end

    def render_menu
        is_showing_black_menu =
            (controller_name == 'vintages' && action_name == 'index') || ((controller_name == 'static_pages' || controller_name == 'wines') &&
              (action_name == 'show' ||
              action_name == 'contacts' ||
              action_name == 'about' ||
              action_name == 'technology' ||
              action_name == 'visit' ||
              action_name == 'club' ||
              action_name == 'terra'))
        if is_showing_black_menu
            render partial: '/front/navigation/menu', locals: { is_black: true }
        else
            render partial: '/front/navigation/menu'
        end
    end
end
