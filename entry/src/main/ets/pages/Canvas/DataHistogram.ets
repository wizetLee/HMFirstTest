class DataHistogramElement {
  color: Color | undefined
  desc: Color | undefined
  value: number | undefined
}

class DataHistogramModel {
  // 柱状信息
  columnar: DataHistogramElement[] = []
  columnarDesc: DataHistogramElement[] = []
  // 比例信息
  scale: DataHistogramElement[] = []
  scaleDesc: DataHistogramElement[] = []
  //value: (()=> void) | undefined
}

@Component
struct DataHistogram {
  @Link model: DataHistogramModel
  
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Canvas(this.context)
      .width('100%')
      .height('100%')
      .backgroundColor('#ffff00')
      .onReady(() => {
        this.context.width;
        this.context.height;


      }) // 绑定
  }
}