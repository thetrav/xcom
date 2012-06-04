class Resty < ApplicationController

  def update
    it = clazz.find(params[:id])
    it.update_attributes(params[param])
    it.save!

    render :json => it
  end

  def new
    render :json => clazz.new
  end

  def create
    render :json => clazz.create!(params[param])
  end

  def show
    render :json => clazz.find(params[:id])
  end

  def index
    render :json => clazz.all
  end

  private
    def clazzName
      self.class.name.gsub("sController","")
    end

    def clazz
      Object::const_get(clazzName)
    end

    def param
      clazzName.underscore.to_sym
    end
end