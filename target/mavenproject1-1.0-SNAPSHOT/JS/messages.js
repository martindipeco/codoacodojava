document.addEventListener("DOMContentLoaded", function () {
    
    function showSuccessModal() {
        if (successParam === 'true') {
            $('#successModal').modal('show');
        }
    }

    // Ensure successParam is defined before calling showSuccessModal
    if (typeof successParam !== 'undefined') {
        showSuccessModal();
    }
});


