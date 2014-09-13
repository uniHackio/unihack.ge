draw = 
  line: (start,end,color) ->
    # strokeStyle = @strokeStyle
    # @stroke()
    strokeStyle = @strokeStyle;
    @beginPath()
    @strokeStyle = (color or "blue")
    @moveTo start[0],start[1]
    @lineTo end[0],end[1]
    @stroke()
    # @beginPath()
    @strokeStyle = strokeStyle

module.exports = draw;