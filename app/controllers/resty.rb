class Resty < ApplicationController

  def update
    it = clazz.find(params[:id])
    it.update_attributes(params[param])
    it.save!

    render :json => it.jsonify
  end

  def show
    render :json => clazz.find(params[:id]).jsonify
  end

  def index
    render :json => clazz.all.map{|it| it.jsonify}
  end

  private
    def clazzName
      self.class.name.gsub("sController","")
    end

    def clazz
      Object::const_get(clazzName)
    end

    def param
      clazzName.downcase.to_sym
    end
end