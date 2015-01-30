Rails.application.routes.draw do

  mount SimpleEditable::Engine => "/simple_editable", as: "simple_editable"
end
