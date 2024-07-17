<?php

namespace App\Http\Controllers;

use App\Models\databarang;
use App\Models\jenisbarang;
use App\Models\surat;
use App\Models\ttd_surat;
//use Barryvdh\DomPDF\PDF;
use Carbon\Carbon;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;
use Barryvdh\DomPDF\Facade\Pdf;

class SuratController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $katakunci = $request->katakunci;
        $jumlahbaris = 10;

        $query = surat::select('tanggal', 'semester', 'unit_kerja')
                    ->distinct();

        if (strlen($katakunci)) {
            $query->where('persediaan', 'like', "%$katakunci%");
        }

        $data = $query->orderBy('tanggal', 'desc')->paginate($jumlahbaris);

        return view('letter.index1')->with('data',$data);
    }

    public function index1(Request $request, string $id)
    {
        $katakunci= $request->katakunci;
        $jumlahbaris =10;
        if(strlen($katakunci)){
            $data= surat::where('persediaan','like',"%$katakunci%")
            ->paginate($jumlahbaris);
        }else{
            $data = surat::orderBy('persediaan','desc')->paginate($jumlahbaris);
        }
        return view('letter.index')->with('data',$data, 'id',$id);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $jenisbarang=jenisbarang::all();
        $databarang = databarang::all();
        $data =surat::all();
        $data2 = session('surat_data', []); 
        return view('letter.create2', compact('databarang','data','jenisbarang'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function surat()
    {
        return $this->hasMany(surat::class); // Periksa apakah nama model sudah sesuai dengan class yang Anda gunakan
    }

    public function store(Request $request)
{
    $request->validate([
        'persediaan' => 'required|array',
        'persediaan.*' => 'required|string',
        'nilai' => 'required|array',
        'nilai.*' => 'required|numeric',
        'tanggal' => 'required|date',
        'semester' => 'required|string',
        'unit_kerja' => 'required|string',
        'no_surat' => 'required|string',
    ], [
        'nilai.required' => 'Nilai wajib diisi',
        'tanggal.required' => 'Tanggal wajib diisi',
        'persediaan.required' => 'Nama Barang wajib diisi',
        'semester.required' => 'semster wajib diisi',
        'unit_kerja.required' => 'unit_kerja wajib diisi',
        'no_surat.required' => 'No Surat wajib diisi',
    ]);

    $tanggal = $request->tanggal;
    $semester = $request->semester;
    $unit_kerja = $request->unit_kerja;
    $no_surat = $request->no_surat;

    foreach ($request->persediaan as $index => $persediaan) {
        surat::create([
            'persediaan' => $persediaan,
            'nilai' => $request->nilai[$index],
            'tanggal' => $tanggal,
            'semester' => $semester,
            'unit_kerja' => $unit_kerja,
            'no_surat' => $no_surat,
        ]);
    }

    return redirect()->to('surat')->with('success', 'Data berhasil ditambahkan');
}
    public function show(string $id)
        {
           // $ttd = ttd_surat::all();
            $surat = surat::where('tanggal', $id)
                ->orWhere('unit_kerja', $id)
                ->orWhere('semester', $id)
                ->get();
            
            $firstSurat = $surat->first();
            if ($firstSurat) {
                $date = Carbon::parse($firstSurat->tanggal);
                $tanggal = $date->isoFormat('dddd [Tanggal] Do [Bulan] MMMM [Tahun] YYYY');
                $tgl = $date->isoFormat('Do MMMM YYYY');
                $tahun = $date->isoFormat('YYYY');
                $unit_kerja = $firstSurat->unit_kerja;
                $ttd_surat = ttd_surat::where('unit_kerja', 'like', '%' . $unit_kerja . '%')->get();
            } else {
                $tanggal = '';
                $tgl = '';
                $tahun = '';
                $unit_kerja = '';
                $ttd_surat = collect(); // Return an empty collection if no matching surat is found
            }
            
        return view('letter.show', compact('surat','tanggal','tgl','tahun','ttd_surat','id','unit_kerja'));
        }
        
    
    public function destroy(string $id)
    {
            //surat::where('persediaan',$id)->delete();
            surat::where('tanggal', $id)
         ->orWhere('unit_kerja', $id)
         ->orWhere('semester', $id)
         ->delete();
            return redirect()->to('surat')->with('success','Berhasil menghapus data');
    }
        
    public function unduh(string $id=null){
        $data=$this->show($id);
        
        $surat = $data->getData()['surat'];
        //$firstSurat =$data->getData()['firstSurat'];
        $date=$data->getData()['date'];
        $tanggal=$data->getData()['tanggal'];
        $tgl=$data->getData()['tgl'];
        $tahun=$data->getData()['tahun'];
        $unit_kerja=$data->getData()['unit_kerja'];
        $ttd_surat=$data->getData()['ttd_surat'];

        // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
    Carbon::setLocale('id');

    // Mengatur ukuran kertas dan orientasi
    $options = new Options();
    $options->set('isHtml5ParserEnabled', true);
    $options->set('isPhpEnabled', true);
    $options->set('defaultFont', 'Arial');

    // Instansiasi DOMPDF
    $dompdf = new Dompdf($options);
    $dompdf->setPaper('letter', 'potrait');

    // Render view dengan data yang diperlukan
    $html = View::make('letter.unduh', compact('surat','tanggal','tgl','tahun','ttd_surat','id','unit_kerja'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('Surat-Berita-Acara.pdf');
    }

    public function cetakSurat(string $id)
    {
         // $ttd = ttd_surat::all();
         $surat = surat::where('tanggal', $id)
         ->orWhere('unit_kerja', $id)
         ->orWhere('semester', $id)
         ->get();
     
     $firstSurat = $surat->first();
     if ($firstSurat) {
         $date = Carbon::parse($firstSurat->tanggal);
         $tanggal = $date->isoFormat('dddd [Tanggal] Do [Bulan] MMMM [Tahun] YYYY');
         $tgl = $date->isoFormat('Do MMMM YYYY');
         $tahun = $date->isoFormat('YYYY');
         $unit_kerja = $firstSurat->unit_kerja;
         $ttd_surat = ttd_surat::where('unit_kerja', 'like', '%' . $unit_kerja . '%')->get();
     } else {
         $tanggal = '';
         $tgl = '';
         $tahun = '';
         $unit_kerja = '';
         $ttd_surat = collect(); // Return an empty collection if no matching surat is found
     }
    return view('letter.unduh', compact('surat','tanggal','tgl','tahun','ttd_surat','id','unit_kerja'));
 
    }

    /**
     * Display the specified resource.
     */

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //$surat= surat::all();
        $jenisbarang=jenisbarang::all();
        $databarang = jenisbarang::all();
         $data = surat::where('tanggal', $id)
        ->orWhere('unit_kerja', $id)
        ->orWhere('semester', $id)
        ->get();
    return view('letter.edit', compact('databarang', 'data','jenisbarang'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
{
    $request->validate([
        'id' => 'required|array',
        'tanggal' => 'required|array',
        'tanggal.*' => 'required|date',
        'semester' => 'required|array',
        'semester.*' => 'required|string',
        'no_surat' => 'required|array',
        'no_surat.*' => 'required|string',
        'unit_kerja' => 'required|array',
        'unit_kerja.*' => 'required|string',
        'persediaan' => 'required|array',
        'persediaan.*' => 'required|string',
        'nilai' => 'required|array',
        'nilai.*' => 'required|numeric',
    ], [
        'nilai.required' => 'Nilai wajib diisi',
        'tanggal.required' => 'Tanggal wajib diisi',
        'persediaan.required' => 'Nama Barang wajib diisi',
        'semester.required' => 'Semester wajib diisi',
        'unit_kerja.required' => 'Unit Kerja wajib diisi',
        'no_surat.required' => 'No Surat wajib diisi',
    ]);

    foreach ($request->id as $index => $id) {
        $surat = surat::findOrFail($id);
        $surat->update([
            'tanggal' => $request->tanggal[$index],
            'semester' => $request->semester[$index],
            'no_surat' => $request->no_surat[$index],
            'unit_kerja' => $request->unit_kerja[$index],
            'persediaan' => $request->persediaan[$index],
            'nilai' => $request->nilai[$index],
        ]);
    }

    return redirect()->to('surat')->with('success', 'Data berhasil diperbarui');
}


    /**
     * Remove the specified resource from storage.
     */
    
}
/*
            $firstSurat = $surat->first();
            $date = Carbon::parse($firstSurat->tanggal);
            //$date = Carbon::parse(); // Example date
            $tanggal = $date->isoFormat('dddd [Tanggal] Do [Bulan] MMMM [Tahun] YYYY');
            $tgl = $date->isoFormat(' Do MMMM YYYY');
            $tahun =$date->isoFormat('YYYY');

            $unit_kerja= surat::where('unit_kerja');
            $ttd_surat = ttd_surat::where('unit_kerja', $unit_kerja)->get();
            */