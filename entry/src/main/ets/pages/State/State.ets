import { LengthMetricsUnit } from '@kit.ArkUI'

@Entry({ routeName: "StatePage" })
@Component
struct StatePage {
  componentName = "StatePage"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  //Component 生命周期
  aboutToAppear(): void {
    console.log(`${this.componentName} - aboutToAppear`)
  }

  aboutToDisappear(): void {
    console.log(`${this.componentName} - aboutToDisappear`)
  }

  // aboutToReuse(params: { [key: string]: Any }): void {
  // }
  aboutToRecycle(): void {
    console.log(`${this.componentName} - aboutToRecycle`)
  }

  @State list: StatePageElementModel[] = [
    new StatePageElementModel("111", 1),
    new StatePageElementModel("222", 2),
    new StatePageElementModel("333", 3),
    new StatePageElementModel("444", 4),
    new StatePageElementModel("555", 5),
  ]

  build() {
    this.lazyForEachTest()
  }

  @Builder
  lazyForEachTest() {
    Column() {
      LazyForEach()
    }
  }

  @Builder
  forEachTest() {
    Column() {
      ForEach(this.list, (element: StatePageElementModel, index) => {
        StatePageComponent({ model: element })
        // 下面这么写是不行的...🙅
        // Column() {
        //   Row() {
        //     Text(element.name)
        //     Blank().width(20)
        //     Text("${element.age}")
        //   }.height(55).onClick(() => {
        //     this.list[index].name = "呵呵"
        //     this.list[index].age = 998
        //   })
        //   Blank().height(1).backgroundColor(Color.Black)
        // }
      }, (item: StatePageElementModel) => {
        return item.name + item.age
      }
      )
    }.backgroundColor(Color.White)
  }
}

class ObjExtendIDataSource implements IDataSource {

  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return 0;
  }

  getData(index: number): any {
    throw new Error('Method not implemented.')
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    throw new Error('Method not implemented.')
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    throw new Error('Method not implemented.')
  }
}


@Component
struct StatePageComponent {
  @ObjectLink model: StatePageElementModel;

  build() {
    Column() {
      Row() {
        Text(this.model.name)
        Blank().width(20)
        Text("${element.age}")
      }.height(55).onClick(() => {
        this.model.name = "呵呵"
        this.model.age = 998
      })

      Blank().height(1).backgroundColor(Color.Black)
    }
  }
}

@Observed
class StatePageElementModel {
  @Track name: string;
  @Track age: number;

  constructor(
    name: string,
    age: number
  ) {
    this.name = name;
    this.age = age;
  }
}


// @Observed
// class Article {
//   id: string;
//   title: string;
//   brief: string;
//   isLiked: boolean;
//   likesCount: number;
//
//   constructor(id: string, title: string, brief: string, isLiked: boolean, likesCount: number) {
//     this.id = id;
//     this.title = title;
//     this.brief = brief;
//     this.isLiked = isLiked;
//     this.likesCount = likesCount;
//   }
// }

// @Entry({ routeName: "StatePage" })
// @Component
// struct ArticleListView {
//   @State articleList: Array<Article> = [
//     new Article('001', '第0篇文章', '文章简介内容', false, 100),
//     new Article('002', '第1篇文章', '文章简介内容', false, 100),
//     new Article('003', '第2篇文章', '文章简介内容', false, 100),
//     new Article('004', '第4篇文章', '文章简介内容', false, 100),
//     new Article('005', '第5篇文章', '文章简介内容', false, 100),
//     new Article('006', '第6篇文章', '文章简介内容', false, 100),
//   ];
//
//   build() {
//     List() {
//       ForEach(this.articleList, (item: Article) => {
//         ListItem() {
//           ArticleCard({
//             article: item
//           })
//             .margin({ top: 20 })
//         }
//       }, (item: Article) => item.id)
//     }
//     .padding(20)
//     .scrollBar(BarState.Off)
//     .backgroundColor(0xF1F3F5)
//   }
// }
//
// @Component
// struct ArticleCard {
//   @ObjectLink article: Article;
//
//   handleLiked() {
//     this.article.isLiked = !this.article.isLiked;
//     this.article.likesCount = this.article.isLiked ? this.article.likesCount + 1 : this.article.likesCount - 1;
//   }
//
//   build() {
//     Row() {
//       Image($r('app.media.app_icon'))
//         .width(80)
//         .height(80)
//         .margin({ right: 20 })
//
//       Column() {
//         Text(this.article.title)
//           .fontSize(20)
//           .margin({ bottom: 8 })
//         Text(this.article.brief)
//           .fontSize(16)
//           .fontColor(Color.Gray)
//           .margin({ bottom: 8 })
//         Row() {
//           // Image(this.article.isLiked ? $r('app.media.') : $r('app.media.iconUnLiked'))
//           //   .width(24)
//           //   .height(24)
//           //   .margin({ right: 8 })
//           Text(this.article.isLiked ? "喜欢" : "不喜欢")
//           Text(this.article.likesCount.toString())
//             .fontSize(16)
//         }
//         .onClick(() => this.handleLiked())
//         .justifyContent(FlexAlign.Center)
//       }
//       .alignItems(HorizontalAlign.Start)
//       .width('80%')
//       .height('100%')
//     }
//     .padding(20)
//     .borderRadius(12)
//     .backgroundColor('#FFECECEC')
//     .height(120)
//     .width('100%')
//     .justifyContent(FlexAlign.SpaceBetween)
//   }
// }


// Basic implementation of IDataSource to handle data listener
class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];

  private originDataArray: string[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}