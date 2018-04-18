class AssignmentIdPdf < Prawn::Document
  def initialize(assignment)
    super(top_margin: 70)
    @assignment = assignment
    assignment_id
    line_item_rows

  end

  def assignment_id
    text "Assignment  \##{@assignment.id} \n",size: 25, style: :bold
  end

  def line_item_rows
   text  "Title : #{@assignment.title} \n Description: #{@assignment.description} Instructor : #{@assignment.user.name}",size: 16
  end

end
