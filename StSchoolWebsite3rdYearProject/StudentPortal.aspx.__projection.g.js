
/* BEGIN EXTERNAL SOURCE */

        // Function to show selected content and hide others
        function showContent(sectionId) {
            document.getElementById('personalDetails').style.display = 'none';
            document.getElementById('registration').style.display = 'none';
            document.getElementById('reports').style.display = 'none';
            document.getElementById('mysubjects').style.display = "none";

            document.getElementById(sectionId).style.display = 'block';
        }

        // Event listeners for navigation clicks



        document.getElementById('personalDetailsNav').addEventListener('click', function () {
            showContent('personalDetails');
        })

        document.getElementById('registrationNav').addEventListener('click', function () {
            showContent('registration');
        });

        document.getElementById('reportsNav').addEventListener('click', function () {
            showContent('reports');
        });

        document.getElementById('subjectsNav').addEventListener('click', function () {
            showContent('mysubjects')
        })
    
/* END EXTERNAL SOURCE */
