import './bootstrap';

    $('#nama_barang').on('change', function() {
        var nama_barang = $(this).val();
        $.ajax({
            url: '{{ route("autofill") }}',
            method: 'POST',
            data: { nama_barang: nama_barang },
            dataType: 'json',
            success: function(data) {
                $('#id_barang').val(data.id_barang);
            }
        });
    });
    
    
