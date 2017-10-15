class HistogramController < ApplicationController

  def show

    render template: "histogram.html.erb",
      :locals => { grades_counts: grades_counts, grades_bounds:grades_bounds}
  end

  def submitbounds
    render json: {"submit": "grade bounds "}
  end

  def grades_bounds
    #get grade bounds from view, update database lettergrade column
    return "SOME BOUNDs"
  end

  def grades_counts
    #TODO: pass in course params
    grades = Course.first.enrolls.collect(&:lettergrade)
    counts = Hash.new 0

    grades.each do |grade|
      counts[grade] += 1
    end

    return counts
  end

end
