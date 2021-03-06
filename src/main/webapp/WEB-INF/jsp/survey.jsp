<%@include file="header.jsp"%>

  <section id="main-content">
  
 <div class="container">
 <div class="row">
 <div class="col-xs-4 col-sm-4"></div>
 <div class="col-xs-8 col-sm-8">
 <h2>National Park Survey</h2>
 </div>
 </div>
 <div class="row">
  <c:url var="surveyResult" value="/survey" />
  <form class="form-horizontal" action="${surveyResult}" method="POST">
    <div class="form-group">
    <label class="col-xs-4 col-sm-4 control-label" for="chooseAPark">Choose a Park </label>
    <select class="col-xs-4 col-sm-4" name="parkCode">  
      <option value="GNP">Glacier</option>
      <option value="GCNP">Grand Canyon</option>
      <option value="MRNP">Mount Rainier</option>
      <option value="GSMNP">Great Smoky Mountains</option>
      <option value="ENP">Everglades</option>
      <option value="YNP">Yellowstone</option>
      <option value="YNP2">Yosemite</option>
      <option value="CVNP">Cuyahoga Valley</option>
      <option value="RMNP">Rocky Mountain</option>
    </select>
    </div>
    
    <div class="form-group">
    <label class="col-xs-4 col-sm-4 control-label" for="email">Enter Your Email </label>
        <input class="col-xs-4 col-sm-4" type="text" name="email" id="email"/><br/>
    </div>

    <div class="form-group">
      <label class="col-xs-4 col-sm-4 control-label" for="state">State: </label> 
      <select class="col-xs-4 col-sm-4" name="state" id="state">
        <option value="AL">Alabama</option>
        <option value="AK">Alaska</option>
        <option value="AZ">Arizona</option>
        <option value="AR">Arkansas</option>
        <option value="CA">California</option>
        <option value="CO">Colorado</option>
        <option value="CT">Connecticut</option>
        <option value="DE">Delaware</option>
        <option value="DC">District Of Columbia</option>
        <option value="FL">Florida</option>
        <option value="GA">Georgia</option>
        <option value="HI">Hawaii</option>
        <option value="ID">Idaho</option>
        <option value="IL">Illinois</option>
        <option value="IN">Indiana</option>
        <option value="IA">Iowa</option>
        <option value="KS">Kansas</option>
        <option value="KY">Kentucky</option>
        <option value="LA">Louisiana</option>
        <option value="ME">Maine</option>
        <option value="MD">Maryland</option>
        <option value="MA">Massachusetts</option>
        <option value="MI">Michigan</option>
        <option value="MN">Minnesota</option>
        <option value="MS">Mississippi</option>
        <option value="MO">Missouri</option>
        <option value="MT">Montana</option>
        <option value="NE">Nebraska</option>
        <option value="NV">Nevada</option>
        <option value="NH">New Hampshire</option>
        <option value="NJ">New Jersey</option>
        <option value="NM">New Mexico</option>
        <option value="NY">New York</option>
        <option value="NC">North Carolina</option>
        <option value="ND">North Dakota</option>
        <option value="OH">Ohio</option>
        <option value="OK">Oklahoma</option>
        <option value="OR">Oregon</option>
        <option value="PA">Pennsylvania</option>
        <option value="RI">Rhode Island</option>
        <option value="SC">South Carolina</option>
        <option value="SD">South Dakota</option>
        <option value="TN">Tennessee</option>
        <option value="TX">Texas</option>
        <option value="UT">Utah</option>
        <option value="VT">Vermont</option>
        <option value="VA">Virginia</option>
        <option value="WA">Washington</option>
        <option value="WV">West Virginia</option>
        <option value="WI">Wisconsin</option>
        <option value="WY">Wyoming</option>
      </select>
      </div>
      
      <div class="form-group">
      <label class="col-xs-4 col-sm-4 control-label" for="activityLevel">Activity Level: </label> 
      <select class="col-xs-4 col-sm-4" name="activityLevel" id="activityLevel">
        <option value="inactive">Inactive</option>
        <option value="sedentary">Sedentary</option>
        <option value="active">Active</option>
        <option value="extremelyActive">Extremely Active</option>
      </select>
      </div>
      <div class="col-xs-4 col-sm-4"></div>
    <button class="btn btn-primary col-xs-4 col-sm-4" type="submit">Submit Survey</button>
  </form>
  </div>
  </div>
  </section>
<%@include file="footer.jsp"%>