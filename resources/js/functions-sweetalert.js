import Swal from 'sweetalert2';

export function returnToastObjetct(params) {
    return  Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    });
}

export function alertConfirmation(title, textHelp = null, btnConfirmed, btnCancel) {
    return Swal.fire({
        title: title,
        text: textHelp,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: btnConfirmed,
        cancelButtonText: btnCancel
    });
}

export function returnToastSuccess(title = null) {
    const Toast = returnToastObjetct();

    return Toast.fire({
        icon: 'success',
        title: title,        
    });
}

export function returnToastError(title = null) {
    const Toast = returnToastObjetct();

    return Toast.fire({
        icon: 'error',
        title: title,        
    });
}

export function returnToastWarning(title = null) {
    const Toast = returnToastObjetct();

    return Toast.fire({
        icon: 'warning',
        title: title       
    });
}

export function returnToastInfo(title = null) {
    const Toast = returnToastObjetct();

    return Toast.fire({
        icon: 'info',
        title: title        
    });
}