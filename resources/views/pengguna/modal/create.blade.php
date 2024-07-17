<form action="{{ url('create') }}" method="post" enctype="multipart/form-data">
    {{ csrf_field() }}
    <div class="modal fade text-left" id="ModalCreate" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">{{ __('Tambah Pengguna baru') }}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>                    
                </div>
                <div class="modal-body">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="name" class="form-label "><strong>{{ __('Name') }}:</strong></label>
                            <input type="text" value="{{ Session::get('name') }}" name="name" class="form-control  @error('name') is-invalid @enderror">
                            @error('name')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="email" class="form-label"><strong>{{ __('Email') }}:</strong></label>
                            <input type="email" value="{{ Session::get('email') }}" name="email" class="form-control  @error('email') is-invalid @enderror">
                            @error('email')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="jabatan" class="form-label"><strong>{{ __('Jabatan') }}:</strong></label>
                            <input type="text" value="{{ Session::get('jabatan') }} " name="jabatan" class="form-control  @error('jabatan') is-invalid @enderror"">
                            @error('jabatan')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="nip" class="form-label"><strong>{{ __('NIP') }}:</strong></label>
                            <input type="text" value="{{ Session::get('nip') }} " name="nip" class="form-control  @error('nip') is-invalid @enderror">
                            @error('nip')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="password" class="form-label"><strong>{{ __('Password') }}:</strong></label>
                            <input type="password" value="{{ Session::get('password') }} " name="password" class="form-control  @error('password') is-invalid @enderror">
                            @error('password')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <label for="role" class="form-label"><strong>{{ __('Role : (pengelola_barang / ketua / pengguna / kelurahan)') }}</strong></label>
                            <input type="text" value="{{ Session::get('role') }} " name="role" class="form-control  @error('role') is-invalid @enderror">
                        </div>
                        @error('role')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <a href='{{ url('pengguna') }}' class="btn btn-primary" style="text-align: right">Kembali</a>
                        <button type="submit" class="btn btn-success">{{ __('Simpan') }}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>