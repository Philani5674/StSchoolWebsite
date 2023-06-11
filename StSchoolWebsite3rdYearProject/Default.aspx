<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StSchoolWebsite3rdYearProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <header class="hero bg-dark text-white text-center py-5">
        <div class="container">
            <h1 class="display-4">Welcome to Our School</h1>
            <p class="lead">Providing business services in Commerce, Science, and History</p>
            <a  href="Loginn.aspx" class="btn btn-primary btn-lg">Login</a>
        </div>
    </header>

    <!-- Services Section -->
       <section class="services py-5 bg-light">
        <div class="container">
            <h2>Our Services</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title text-primary text-center"><i class="fas fa-4x fa-chart-line"></i> </h5>
                            <p class="card-text">Our Commerce program offers comprehensive courses on business
                                management, accounting, finance, and marketing. Gain the skills and knowledge needed to
                                excel in the world of commerce.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title text-primary text-center"><i class="fas fa-4x fa-flask"></i> </h5>
                            <p class="card-text">  
                            
                                Discover the wonders of science through our Science program. Explore
                                subjects such as physics, chemistry, biology, and environmental sciences. Develop your
                                scientific thinking and problem-solving abilities.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title  text-primary text-center"><i class="fas fa-4x fa-landmark"></i></h5>
                            <p class="card-text">
                                Uncover the past and gain a deeper understanding of human civilization
                                with our History program. Dive into fascinating historical events, civilizations, and
                                cultural developments. Develop critical thinking and analytical skills.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Team Section -->
  <section class="team py-5 bg-light">
        <div class="container">
            <h2>Our Team</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card mb-4 text-center">
                        <div class="card-body">
                            <i class="fas fa-user text-success fa-5x mb-4"></i>
                            <h5 class="card-title">John Doe</h5>
                            <p class="card-text">Commerce Specialist</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4 text-center">
                        <div class="card-body">
                            <i class="fas fa-user text-danger fa-5x mb-4"></i>
                            <h5 class="card-title">Jane Smith</h5>
                            <p class="card-text">Science Expert</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4 text-center">
                        <div class="card-body">
                            <i class="fas fa-user text-primary fa-5x mb-4"></i>
                            <h5 class="card-title">Michael Johnson</h5>
                            <p class="card-text">History Guru</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- Contact Us Section -->
<section class="contact py-5 bg-primary">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto text-center">
                <h2>Contact Us</h2>
                <p>Got any questions or inquiries? We're here to help. Please feel free to reach out to us for any
                    information you need.</p>
                <form action="#" method="POST">
                <div class="row">
                    <div class="col-4">
                      
                        <input type="text" class="form-control" id="name" name="name" placeholder="Your Name" required>
                    </div>
                    <div class="col-8">
                        
                        <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required>
                    </div>
                   
                </div>

                <div class="row">
                    <div class="col-12">
                        
                        <textarea class="form-control" id="message" name="message" placeholder="Your Message" required></textarea>
                    </div> 
                </div>
                    <button type="submit" class="btn btn-light">Submit</button>
                </form>
            </div>
        </div>
    </div>
</section>
<footer class="footer py-4 bg-dark text-white">
    <div class="container text-center">
        <ul class="list-inline mb-0">
            <li class="list-inline-item">
                <a href="#" class="text-white"><i class="fab fa-facebook-f"></i></a>
            </li>
            <li class="list-inline-item">
                <a href="#" class="text-white"><i class="fab fa-twitter"></i></a>
            </li>
            <li class="list-inline-item">
                <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
            </li>
            <li class="list-inline-item">
                <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
            </li>
        </ul>
    </div>
</footer>


 

</asp:Content>

