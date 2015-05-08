<!DOCTYPE html>
<html>  
  <head>
    <meta charset="utf-8">
    <title>GlycoPAT on Web</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="GlycoPAT web application">
    <meta name="author" content="Gang Liu">
    <!--import bootstrap--> 
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    
    <!--import jasny--> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
    
    <!--import fileinput--> 
    <script src="js/fileinput.min.js"></script>
    <link rel="stylesheet" href="css/fileinput.min.css">

	 <!-- Custom CSS -->
    <link href="css/scrolling-nav.css" rel="stylesheet">
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/scrolling-nav.js"></script>
    
    <!--import select--> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.5/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.5/js/bootstrap-select.min.js"></script>
    
  </head>  
  <body class="page-top">	  
<!--       <style> -->
/*         .body{padding-top:70px} */
<!--       </style> -->
      
      <!-- Navigation -->
      <nav class="navbar navbar-default navbar-fixed-top">      
       <div class="container">
        <div class="navbar-header page-scroll">
	          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
          <a class="navbar-brand" href="#">GlycoPAT</a>
        </div>
        
        <!-- collect the nav links, forms and other contents from toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="hidden">
              <a class="page-scroll" href="#page-top" ></a>
            </li>
            <li> 
              <a class="page-scroll" href="#protdigest">Protein Digestion</a>
            </li>
            <li>
              <a class="page-scroll" href="#tandemms">MS/MS Analysis</a>
            </li>            
            <li>
              <a class="page-scroll" href="#contact">Contact</a>
            </li>
          </ul>
        </div>
        <!-- collect the nav links, forms and other contents from toggling -->
        
      </div>
      <!-- container -->
      
    </nav>
    <!-- navbar -->
    
    <!-- Intro Section -->
    <section id="intro" class="intro-section">
        <div class="container">
         <style>
	        .body{padding-top:70px}
	      </style>
            <div class="row">
                <div class="col-lg-12">
                    <h1>GlycoProteomics Analysis</h1>
                    <p></p>
                    <a class="btn btn-default page-scroll" href="#protdigest">Click Me to Start!</a>
                </div>
            </div>
        </div>
    </section>

    <section id="protdigest" class="intro-section">
        <div class="container">
	      <style>
	        .body{padding-top:70px}
	      </style>
	      <div class="row">
        	<div class="col-sm-12">
          	<h4 style="color:red" class="text-left">To create a list of glycopeptide fragments by enzymatic digestion, please
            	provide 9 inputs as listed below:</h4>
          </div>
      </div>
      
      <div class="row">
      <form role="form" method="post" action="DigestWebControl">
      <div class="row">
        <div class="col-sm-6">
        <div class="form-group">
          <label for="input1">
            		1.Select Protein FASTA file:
          </label>
          <input id="input1" type="file" name="protseqfilename" data-show-preview="false" 
               multiple class="file-loading">
          <script>
                $("#input1").fileinput({
                	uploadUrl: "FileUpload",
                	uploadAsync:true,
                	maxFileCount:5,
                	allowedFileExtensions: ["txt"]
                });
          </script>
        </div>
       </div>
        <div class="col-md-6">
        <div class="form-group">
          <label for="input2">
                2. Select Fixed Protein Modification file: 
          </label>
            <input id="input2" type="file" name="fixedptmfilename" data-show-preview="false" 
                 multiple class="file-loading">
            <script>
                $("#input2").fileinput({
                	uploadUrl: "FileUpload",
                	uploadAsync:true,
                	maxFileCount:5,
                	allowedFileExtensions: ["txt"]
                });
            </script>
        </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="form-group">
	          <label for="input3">
	            		3. Select Variable Protein Modification file:
	          </label>
	          <input id="input3" type="file" multiple class="file-loading" 
	             name="variableptmfilename" data-show-preview="false">
	          <script>
                $("#input3").fileinput({
                	uploadUrl: "FileUpload",
                	uploadAsync:true,
                	maxFileCount:5,
                	allowedFileExtensions: ["txt"]
                });
               </script>
           </div>
        </div>
        
        <div class="col-md-6">
          <div class="form-group">
              <label for="input4">
                  4.Select the enzyme from the list:
          	  </label>
              <select id="input4" class="form-control"name="enz"> 
                 <option>Trypsin</option>
                 <option>GluC</option>
                 <option>Lys-C </option>
                 <option>CNBR</option>
              </select>
           </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3">
          <div class="form-group">
            <label for="maxmisscleavage">
              <b>5. Max. Missing Cleaveage</b>
            </label>
            <input type="text" class="form-control" id="maxmisscleavages" placeholder="Enter 0-3" name="missedMax">
          </div>
        </div>
        <div class="col-md-3">
          <div class="form-group">
            <label for="minpeplength">
              <b>6. Min. Peptide Length</b>
            </label>
            <input type="text" class="form-control" id="minpeplength" placeholder="Enter 2-10" name="minPepLen">
          </div>
        </div>
        <div class="col-md-3">
          <div class="form-group">
            <label for="maxpeplength">
              <b>7. Max. Peptide Length</b>
            </label>
            <input type="text" class="form-control" id="maxpeplength" placeholder="Enter 35-50" name="maxPepLen">
          </div>
        </div>
        <div class="col-md-3">
          <div class="form-group">
            <label for="maxnomod">
              <b>8. Max. Number Modification</b>
            </label>
            <input type="text" class="form-control" id="maxnomod" placeholder="Enter 1-3" name="maxPTM">
          </div>
        </div>
        <div class="col-md-3">
          <div class="form-group">
            <label for="minnomod">
              <b>9. Min. Number Modification</b>
            </label>
            <input type="text" class="form-control" id="minnomod" placeholder="Enter 0-1" name="minPTM">
          </div>
        </div>
      </div>
      <div class="row">
      	<div class="col-md-12">
      	  <div class="form-group">
      	      <div class="span 7 text-center">
         	  	<button type="submit" class="btn btn-primary">Digest</button>
         	  </div>
          </div>
        </div>
      </div>
      
      <div class="row">
      	<div class="col-md-12">
      	  <div class="form-group">
      	      <label for="digtpep">List of Digested Peptides:</label>
         	  <textarea class="form-control" rows="10" id="digtprot">
         	  <%
         	    String display="";
         	    display=(String) request.getAttribute("digest"); 
         	    if(display!=null){
         	      out.println(display);
         	    }
         	  %>
         	  </textarea>
          </div>
        </div>  
      </div>
    </form>
    </div>
    </div>
    </section>
    
    <!-- Services Section -->
    <section id="tandemms" class="intro-section">
        <div class="container">
          <style>
	        .body{padding-top:70px}
	      </style>
            <div class="row">
                <div class="col-lg-12">
                    <h1></h1>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="intro-section">
        <div class="container">
         <style>
	        .body{padding-top:70px}
	      </style>
            <div class="row">
                <div class="col-lg-12">
                    <h1></h1>
                </div>
            </div>
        </div>
    </section>
    
      
  </body>
</html>