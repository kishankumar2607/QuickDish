<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="QuickDish.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container about-section mt-5">
            <div class="text-center mb-5 pb-4 pt-4">
                <h3 class="fw-bold mb-3">About QuickDish</h3>
                <p class="lead">
                    Your go-to platform for fast, fresh food delivery from your favorite
                    local restaurants.
                </p>
            </div>

            <div class="row align-items-center mb-5">
                <div class="col-md-6">
                    <img src="image/delivery_team.png" alt="Delivery team" class="img-fluid rounded shadow" />
                </div>
                <div class="col-md-6">
                    <h4 class="about-heading mb-3">Who We Are</h4>
                    <p>
                        Founded with the mission to connect food lovers with the best local restaurants,
                        QuickDish is built by a team of passionate developers and foodies. We value speed,
                        quality, and a seamless experience from cart to doorstep.
                    </p>
                    <ul class="about-ul">
                        <li>💡 Founded in 2025 as a college project</li>
                        <li>🍕 Supports over 10 local restaurants during launch phase</li>
                        <li>🚀 Built using modern web technologies like ASP.NET and Bootstrap</li>
                        <li>💬 Constantly evolving based on customer feedback</li>
                    </ul>
                </div>
            </div>

            <div class="row align-items-center mb-5 pt-5 flex-md-row-reverse">
                <div class="col-md-6">
                    <img src="image/our_mission.jpg" alt="Mission" class="img-fluid rounded shadow" />
                </div>
                <div class="col-md-6">
                    <h4 class="about-heading mb-3">Our Mission</h4>
                    <p>
                        To make great food accessible quickly and reliably while supporting local businesses
                        and ensuring customer satisfaction at every step.
                    </p>
                    <ul class="about-ul">
                        <li>⚡ Deliver hot, fresh meals faster than traditional ordering methods</li>
                        <li>📈 Help all restaurants grow through online exposure</li>
                        <li>🛒 Offer a platform with real-time order tracking and secure checkout</li>
                        <li>🤝 Promote fairness and transparency in partnerships with vendors</li>
                    </ul>
                </div>
            </div>

            <div class="row align-items-center mb-5 pt-5">
                <div class="col-md-6">
                    <img src="image/our_vision.jpg" alt="Vision" class="img-fluid rounded shadow" />
                </div>
                <div class="col-md-6">
                    <h4 class="about-heading mb-3">Our Vision</h4>
                    <p>
                        To become the most trusted and loved food delivery platform by continuously innovating
                        and exceeding expectations in quality and convenience.
                    </p>
                    <ul class="about-ul">
                        <li>🌐 Become a leading food tech platform in small business space</li>
                        <li>📱 Launch mobile apps with integrated loyalty programs</li>
                        <li>🌱 Encourage sustainability by promoting eco-friendly packaging partners</li>
                        <li>🤖 Innovate with AI-driven recommendations and predictive ordering</li>
                    </ul>
                </div>
            </div>

            <div class="mb-5 pt-5">
                <div class="text-center">
                    <h4 class="about-heading mb-4">Why Choose Us?</h4>
                </div>
                <div class="main-card">
                    <div class="text-center choose-us-card">
                        <h6 class="fw-bold mt-2">Fast Delivery</h6>
                        <p>We ensure your food reaches you fresh and fast.</p>
                    </div>
                    <div class="text-center choose-us-card">
                        <h6 class="fw-bold mt-2">Top-rated Restaurants</h6>
                        <p>Only the best local eateries, handpicked for quality.</p>
                    </div>
                    <div class="text-center choose-us-card">
                        <h6 class="fw-bold mt-2">Secure Payments</h6>
                        <p>Safe and secure with multiple payment options.</p>
                    </div>
                </div>
            </div>

            <div class="row align-items-center mb-5 flex-md-row-reverse pt-5">
                <div class="col-md-6">
                    <img src="image/team.jpg" alt="Team" class="img-fluid rounded shadow" />
                </div>
                <div class="col-md-6">
                    <h4 class="about-heading mb-3">Meet the Team</h4>
                    <p>
                        We are a team of tech enthusiasts, designers, and marketing professionals with a
                        shared love for food and innovation. Together, we build and grow QuickDish to serve
                        our users better every day.
                    </p>
                    <ul class="about-ul">
                        <li>👨‍💻 <strong>Developers:</strong> Focused on building fast, secure & scalable web
                            functionality</li>
                        <li>🎨 <strong>Designers:</strong> Create clean, accessible, and user-friendly interfaces
                        </li>
                        <li>📊 <strong>Analysts:</strong> Ensure data-driven decisions and optimize customer
                            experience</li>
                        <li>📢 <strong>Marketing & Support:</strong> Help users find and love QuickDish with
                            ease</li>
                    </ul>
                </div>
            </div>

            <div class="text-center mt-5 pt-5 pb-3">
                <h5 class="text-muted mb-4 pb-3">Join thousands of happy customers — download the app or order
                    now!</h5>
                <a href="Restaurants" class="button">Explore Restaurants</a>
            </div>
        </div>
    </main>
</asp:Content>
