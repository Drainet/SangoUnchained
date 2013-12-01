Animation = {}
function Animation:newFadeImage(image,startX,startY)
end

function Animation:newSpark(startX,startY)
    local spark = display.newImage("kalacool/sango/image/item/spark2.png")
    spark.height=spark.height/4
    spark.width=spark.width/4
    spark.x= startX
    spark.y= startY
    spark:rotate(math.random(360))
    function deleteSpark()
        display.remove(spark)
    end
    camera:insert(spark)
    transition.to( spark, { time=500, delay=0, alpha=0.0, xScale=3, yScale=3, onComplete = deleteSpark} )


end

function Animation:newBom(startX,startY)
    local spark = display.newImage("kalacool/sango/image/item/spark2.png")
    spark.height=spark.height*4
    spark.width=spark.width*4
    spark.x= startX
    spark.y= startY
    spark:rotate(math.random(360))
    function deleteSpark()
        display.remove(spark)
    end
    camera:insert(spark)
    transition.to( spark, { time=500, delay=0, alpha=0.0, xScale=3, yScale=3, onComplete = deleteSpark} )
end


function Animation:wound()
    local myRectangle = display.newRect(0, 0, 2000, 1500)
    myRectangle:setFillColor(255, 0, 0)
    myRectangle.x=display.contentCenterX
    myRectangle.y=display.contentCenterY
    myRectangle.alpha=0.5
    function deleteRectangle()
        display.remove(myRectangle)
    end
   
    transition.to( myRectangle, { time=300, delay=0, alpha=0.0, onComplete = deleteRectangle} )


end


function Animation:newFire(startX,startY)

    function burnning()
        local fire = display.newImage("kalacool/sango/image/item/fire3.png")

        fire:translate(startX,startY)


        function deleteFire()
            display.remove(fire)
        end
        camera:insert(fire)
          transition.to(fire, { time=500, delay=0, alpha=0.0, xScale=3, yScale=3,x=startX+math.random(100),y=startY-0.5*fire.height,onComplete = deleteFire} )
    end
    timer.performWithDelay(200, burnning,0 )
end

return Animation